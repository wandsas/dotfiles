#!/bin/sh

source stdout-logger.sh
source path.sh

print_version_if_need () {
    if echo "$1" | grep -Eq '(-v|--version)'; then
        BASEDIR=$(dirname "$0");
        PACKAGE="$BASEDIR/../package.json";
        VERSION=$(grep '"version":' "$PACKAGE"| cut -d\" -f4)
        echo "v$VERSION";
        exit;
    fi
}

exit_if_no_args () {
    local file=$1
    local size=$2

    if [ -z "$file" ] || [ -z "$file" ]; then
         die "loop <file> <size>"
    fi
}

check_com () {
    type "$1" &> /dev/null || (warn "command $1 does not exist" && return 1);
}

check_deps () {
    check_com fallocate;
    check_com mkfs.ext4;
    check_com e2fsck;
    check_com resize2fs;
}

print_missing () {
    echo "$1 is missing, please install it";
}

create_file_when_not_exist () {
    local file=$1
    local size=$2
    local label=${3:-NOLABEL}

    if [ ! -f "$file" ]; then
        fallocate -l "$size" "$file" || \
        dd if=/dev/zero of="$file" bs="$size" seek=1 count=0

        sudo mkfs.ext4 -O ^has_journal -E stride=2,stripe-width=1024 -b 4096 "$file" -L "$label"
        sudo e2fsck -f "$file"
    fi
}

resize () {
    local file=$1
    local size=$2

    e2fsck -fy $file
    resize2fs $file $size
}
