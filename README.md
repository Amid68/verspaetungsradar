# Verspätungsradar

Ein Dienst, der Echtzeitdaten der Deutschen Bahn sammelt und Verspätungen auswertet, betrieben auf einer selbst aufgebauten AWS-Plattform (EKS, OpenTofu, GitOps).

## Vorgehen

Jede Komponente wird zuerst von Hand in der AWS-Konsole gebaut, dann mit der AWS CLI und erst danach als Code mit OpenTofu. So bleibt nachvollziehbar, was die Automatisierung tatsächlich tut.

## Stand

### AWS-Organisation

```
Root
├── management
└── Workloads
    ├── NonProd
    │   └── dev
    └── Prod
```

- Zugriff ausschließlich über IAM Identity Center (eu-central-1) mit MFA, keine IAM-User und keine langlebigen Access Keys
- Root-User mit MFA und ohne Access Keys
- Budget `monthly-limit` (30 USD) mit Warnungen bei 85 % und 100 % der tatsächlichen sowie 100 % der prognostizierten Kosten
- Workloads laufen in eu-central-1 (Frankfurt)

## Secret-Scanning

- [Betterleaks](https://github.com/betterleaks/betterleaks) prüft in GitHub Actions jeden Push und Pull Request
- Lokal prüft ein Pre-Commit-Hook die gestagten Änderungen, bevor sie committet werden. Aktivieren mit:

  ```bash
  git config core.hooksPath .githooks
  ```

## Entscheidungen

- [ADR 0001: Ein Repository für das gesamte Projekt](docs/adr/0001-monorepo.md)
