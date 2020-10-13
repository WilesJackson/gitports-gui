from gooey import Gooey, GooeyParser
import os
import constants
import json

portsConfig = {}

@Gooey(
  target="gitports",
  program_name="WJ Gitports V1 - Alpha",
  suppress_gooey_flag=True,
  show_sidebar=True,
  menu=[{
    'name': 'File',
    'items': [{
      'type': 'AboutDialog',
      'menuTitle': 'About',
      'name': 'GitPorts GUI Shell',
      'description': 'A GUI Wrapper for the GitPorts Command Line Utility',
      'version': '0.0.1-alpha',
      'copyright': '2020',
      'website': 'https://www.wilesjackson.com',
      'developer': 'Joe Hopkins (joeyhops) - https://github.com/joeyhops',
      'license': 'MIT'
    }]
  }],
  advanced=True
)
def main():
  path = os.getenv('LOCALAPPDATA')
  array = os.listdir(path)
  print(portsConfig)
  parser = GooeyParser(description="Generate Reports from Github Repositories using GitPorts")
  subparsers = parser.add_subparsers(help="GitPorts Reports")

## Issues
  issuePorts = subparsers.add_parser('issue', help='GitPorts Report Generation for GitHub Issues')
  issuePorts.add_argument('repo', metavar='Repository', help='Github Repo to generate report from', type=str)
  issuePorts.add_argument('-t', metavar='User Token', help='GitHub User Token for Repo', required=True, type=str)
  issuePorts.add_argument('-p', metavar='Page Count', help='Number of pages to generate report from (100/page)', default=1, type=int)
  issuePorts.add_argument('-l', metavar='Issue Labels', help='Filter based on Issue Labels (comma-seperated list)', type=str)

## Setup
  setupPorts = subparsers.add_parser('setup', help='Setup utils for GitPorts')
  setupPorts.add_argument('-t', metavar='Save User Token', help='Output token to config file for quicker report generation', type=str, required=True)
  setupPorts.add_argument('-o', metavar='Default Repository Owner', help='Default Repository Owner')

  parser.parse_args()

def conf():
  global portsConfig
  if constants.GITPORTS_DIR_EXISTS:
    with open(constants.GITPORTS_CONFIG) as cData:
      portsConfig = json.load(cData)
  else:
    raise Exception("No config data found")

if __name__ == '__main__':
  conf()
  main()