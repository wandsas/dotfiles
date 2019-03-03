import subprocess
import os
import json

def passwd(file_name):
  acct = os.path.basename(file_name)
  path = "/home/wandsas/.password-store/mail/%s" % file_name
  args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
  try:
    return subprocess.check_output(args).strip()
  except subprocess.CalledProcessError:
    return ""

def oauthpasswd(acct, key):
  acct = os.path.basename(acct)
  path = "/home/.password-store/mail/%s.offlineimap.gpg" % acct
  args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
  try:
    return str(json.loads(subprocess.check_output(args).strip())['installed'][key])
  except subprocess.CalledProcessError:
    return ""

def prime_gpg_agent():
  ret = False
  i = 1
  while not ret:
    ret = (passwd("prime.gpg") == "prime")
    if i > 2:
      from offlineimap.ui import getglobalui
      sys.stderr.write("Error reading in passwords. Terminating.\n")
      getglobalui().terminate()
    i += 1
  return ret

prime_gpg_agent()
