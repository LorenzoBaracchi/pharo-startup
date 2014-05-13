import argparse
import subprocess as sub
import sys
from termcolor import colored

def createarguments():
	"""
	Function to create arguments that can be passed to the main function
	"""
	parser = argparse.ArgumentParser()
	parser.add_argument('-n', '--new', help="Downoad a new verion of Pharo", required=False, action="store_true")
	return parser
	
	
def move_to_old():
	"""
	Move current pharo to "backup directory"
	"""
	print colored("Mooving Pharo to Pharo-old...", 'blue')
	sub.call("rm -rf ~/Pharo-old", shell=True)
	sub.call("mv -f ~/Pharo/ ~/Pharo-old", shell=True)
	sub.call("rm -rf ~/Pharo", shell=True)
	

def download_new():
	"""
	Download new version of pharo
	"""
	print colored("Downloading Pharo zeroconf script", 'blue')
	sub.call("mkdir ~/Pharo", shell=True)
	sub.call("cd ~/Pharo && wget -O- get.pharo.org/30+vmLatest | bash", shell=True)
	

def set_memory():
	"""
	Increase the maximum memory
	"""
	sub.call("sed -i '' 's/536870912/900000000/g' ~/Pharo/pharo-vm/Pharo.app/Contents/Info.plist", shell=True)
	

def start_pharo():
	"""
	Starting Pharo
	"""
	print colored("Starting pharo...", 'blue')
	sub.call("~/Pharo/pharo-ui ~/Pharo/Pharo.image &", shell=True)	


def main():
	global quietmode
	parser = createarguments()
	args = vars(parser.parse_args())
	if args['new']:
		move_to_old()
		download_new()
		set_memory()
	start_pharo()


if __name__ == "__main__":
	main()
