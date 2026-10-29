FROM grafana/grafana:12.4.8

# Provisioned datasource + dashboards (declarative; reapplied on every start).
COPY provisioning /etc/grafana/provisioning

ENV GF_PATHS_PROVISIONING=/etc/grafana/provisioning \
    GF_SERVER_ROOT_URL=https://grafana.salmaanakhtar.com \
    GF_AUTH_ANONYMOUS_ENABLED=true \
    GF_AUTH_ANONYMOUS_ORG_ROLE=Viewer \
    GF_USERS_ALLOW_SIGN_UP=false \
    GF_SECURITY_ADMIN_PASSWORD=changeme

EXPOSE 3000
