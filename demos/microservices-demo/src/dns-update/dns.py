from typing import Optional
import config
from google.cloud import dns

def update_dns(zone_name: str, dns_name: str, ttl: int = 60, force_update: bool = False,
               project_id: Optional[str] = None):
    """
    Updates a GCP Cloud DNS zone with the host's current IP as it appears from the internet
    :param zone_name: the name of the zone in your GCP project
    :param dns_name: the DNS name, e.g. `www.example.com`, to update
    :param ttl: the ttl of the new record
    :param force_update: if True, the records will be updated even if they are not different
    :param project_id: the GCP project id
    :return: the applied change set
    """

    try:
        zone_name = config.ZONE_NAME
        gcp_service_ip = config.GCP_SERVICE_IP
    except:
        raise ValueError("Env not set for Flask application")

    if not dns_name.endswith("."):
        dns_name = "%s." % dns_name

    if project_id:
        client = dns.Client(project_id)
    else:
        client = dns.Client()
    zone = client.zone(zone_name)

    addresses = os.environ['GCP_SERVICE_IP']

    ipv4_addresses = addresses
    
    changes = zone.changes()
    for record in zone.list_resource_record_sets():
        if record.name == dns_name and record.record_type in ("A", "AAAA"):
            changes.delete_record_set(record)

    if len(ipv4_addresses) > 0:
        changes.add_record_set(zone.resource_record_set(dns_name, "A", ttl, list(ipv4_addresses)))
    
    changes.create()
    return changes

if __name__ == "__main__":
    update_dns()