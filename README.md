# grafana-private

Grafana 12 for the salmaan.dev VPS, served at `grafana.salmaan.dev`
(Tailscale-private). Provides detailed time-series reporting on top of the
Prometheus backend; the unified overview lives at `dashboard.salmaan.dev`.

## Provisioning

- `provisioning/datasources/prometheus.yaml` — Prometheus datasource
  (`http://hermes-prometheus:9090` on the internal `hermes_routing` network).
- `provisioning/dashboards/host-overview.json` — "VPS Host Overview"
  dashboard: CPU/load/memory/disk/network/swap from node-exporter, per-container
  CPU/memory and a container table from the hermes host-agent.

Datasources and dashboards are declarative (reapplied on every start), so the
Grafana database is ephemeral. Custom user edits are not persisted across
rebuilds — change the provisioning files instead.

## Access

- Anonymous viewer (no login) for dashboards.
- Admin login: password is injected at deploy time via the deployer secret
  `GF_SECURITY_ADMIN_PASSWORD` (not stored in Git).
- Only reachable from Tailscale devices (Traefik `tailscale-only` middleware +
  A record pointing at the tailnet IP).
