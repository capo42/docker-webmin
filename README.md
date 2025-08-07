# 🛠️ Docker Webmin (by capo42)

Ein schlankes Docker-Image für [Webmin](https://www.webmin.com/) auf Basis von Ubuntu 22.04 – vollständig konfiguriert, mit persistenter Konfiguration via Docker Compose.

---

## 📦 Features

- Basierend auf `ubuntu:22.04`
- Installiert direkt Webmin über offizielles Repo
- Inklusive `iproute2` für Netzwerkmodule
- Root-Login beim ersten Start vorkonfiguriert (`root` / `rootpass`)
- Docker Compose mit persistenter Konfiguration

---

## 🚀 Quickstart

```bash
git clone https://github.com/capo42/docker-webmin.git
cd docker-webmin
docker compose up -d
```

> Webinterface: https://localhost:10000

---

## 🔐 Standard-Login (nur für Testzwecke)

| Benutzer | Passwort   |
|----------|------------|
| `root`   | `rootpass` |

> 🔒 Bitte im Produktivbetrieb sofort ändern!

---

## 🔧 Verzeichnisstruktur (Container)

| Pfad im Container    | Zweck                      |
|----------------------|----------------------------|
| `/etc/webmin`        | Konfiguration              |
| `/var/webmin`        | Logs & temporäre Daten     |

---

## 🧰 Docker Compose Details

```yaml
volumes:
  webmin_config: speichert /etc/webmin
  webmin_logs: speichert /var/webmin

ports:
  - "10000:10000" # Webmin UI
```

Netzwerk: `webmin-net` (custom bridge)

---

## 🏗️ Build lokal (optional)

```bash
docker build -t capo42/webmin:1.0 .
```

---

## 📤 Deployment auf Docker Hub

```bash
docker login
# Tag setzen (falls nötig)
docker tag capo42/webmin:1.0 capo42/webmin:latest
docker push capo42/webmin:latest
```

---

## 🧼 ToDo / Ideen

- [ ] Automatisches Setzen des root-Passworts per ENV
- [ ] Eigener Healthcheck für Port 10000
- [ ] Addons: Fail2Ban, BIND9, Docker-Modul
- [ ] Eigene Themes

---

## 🧙‍♂️ Maintainer

**capo42** – [github.com/capo42](https://github.com/capo42)
