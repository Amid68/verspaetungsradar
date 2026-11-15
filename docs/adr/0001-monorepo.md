# 0001: Ein Repository für das gesamte Projekt

- Status: Angenommen
- Datum: 2026-11-15

## Kontext

Das Projekt besteht aus Infrastruktur (OpenTofu), Kubernetes-Manifesten für GitOps und der Anwendung selbst. Diese Teile können in getrennten Repositories oder gemeinsam in einem liegen.

## Entscheidung

Alles liegt in einem Repository mit getrennten Verzeichnissen: `infra/`, `gitops/`, `app/` und `docs/`.

## Konsequenzen

- Ein einziger Link zeigt das gesamte Projekt. Änderungen, die mehrere Teile betreffen, landen in einem Pull Request.
- Argo CD beobachtet nur `gitops/`. Änderungen an anderen Verzeichnissen lösen keinen Sync aus.
- CI-Workflows filtern nach Pfaden, damit nicht jede Änderung alle Pipelines startet.
- Zugriffsrechte lassen sich nicht pro Teil trennen. Für ein Ein-Personen-Projekt ist das kein Nachteil.
