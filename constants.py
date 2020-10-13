import os

localAppData = os.getenv('LOCALAPPDATA') 
## Constants for GitPorts
GITPORTS_DATA = os.path.join(localAppData, 'gitports')
GITPORTS_CONFIG = os.path.join(GITPORTS_DATA, 'conf.json')
GITPORTS_DIR_EXISTS = os.path.exists(GITPORTS_DATA)