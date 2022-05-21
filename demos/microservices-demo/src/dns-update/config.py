# config.py
from os import getenv

ZONE_NAME = getenv('ZONE_NAME', None)
assert ZONE_NAME  # Set ZONE_NAME ENV 

GCP_SERVICE_IP = getenv('GCP_SERVICE_IP', None)
assert GCP_SERVICE_IP  # Set GCP_SERVICE_IP ENV 

