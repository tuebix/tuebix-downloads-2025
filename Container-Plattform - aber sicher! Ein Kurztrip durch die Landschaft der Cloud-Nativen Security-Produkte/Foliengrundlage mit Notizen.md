---
index:
  title: Container-Plattform - aber sicher!
  subtitle: Ein Kurztrip durch die Landschaft der Cloud-Nativen Security-Produkte
slides:
  separator_notes: "^Notes?:"
  separator_vertical: ^#----*$$  # nach unten
  separator: ^#====*$            # rechts/links
  theme: https://puzzle.github.io/pitc-revealjs-theme/2/puzzle.css
revealjs:
  transition: slide
  center: false
  markdown:
    breaks: true
  controls: true
  progress: true
  help: true
  autoPlayMedia: true
---

<!-- .slide: class="l-cover" -->

<!--
Eine klassische IT-Landschaft unterscheidet sich nicht grundlegend von einer Container-basierten Umgebung. Dennoch greifen bewährte Sicherheits- und Überwachungsmaßnahmen nicht mehr oder nicht effizient. Mit SUSE Security (NeuVector) und Red Hat Advanced Cluster Security stehen potente Lösungen zur Verfügung. Der Vortrag soll zeigen, welche Herausforderungen mit diesen Ansätzen bewältigt werden können.

Es sollte das Verständnis vorhanden sein, was eine Container Plattformen auf kubernetes-Basis ist. Erfahrungen mit dem Erstellen von Applikationen auf einer solchen Plattform sind wünschenswert.
//-->

# Container-Plattform
# - aber sicher!
## *Ein Kurztrip durch die Landschaft der Cloud-Nativen Security-Produkte*

Lukas Kallies

Note:

- Puzzle ITC (CH/DE)
- Bern/Zürich/Basel/Tübingen
- Software und IT Dienstleistungen
- Linux Engineering/Automation, Container und SSO, Softwareentwicklung

#----

<!-- .slide: class="l-team l-icons--big" -->

# Nice to meet you

- ![Lukas Kallies](https://www.puzzle.ch/img/2024/06/LukasKallies.jpg?w=450&h=450&fit=crop&fm=webp&q=90&sharp=4&s=a1bf05d37f93cd1e3488bd60acfc72dc)
  - Lukas Kallies
  - #### @lubeka@mastodon.social

Note:

- Linux und Container Solution Architect

#----

# Organisatorisches

- Bei Fragen, fragen!

Note:

- (Diesmal) nicht die Infrastruktur-Seite
- Erfahrungen

#====
<!-- .slide: class="l-agenda" -->
# Agenda

1. Allgemeine Sicherheitsanforderungen
2. Klassische IT-Landschaften
3. Containerbasierte Umgebungen
4. Herausforderungen / Unterschiede dieser Umgebungen
5. Red Hat Advanced Cluster Security und SUSE Security
6. Fazit

Note:

ACS aka StackRox
SUSE Security aka NeuVector

#====
<!-- .slide: class="l-agenda" -->
# Allgemeine Sicherheitsanforderungen

Vertraulichkeit

Integrität

Verfügbarkeit

Note:

- Sicherstellen, dass Informationen nur autorisierten Personen zugänglich sind (Beispiel RBAC)
- Sicherstellen, dass Informationen korrekt, vollständig und unverändert sind und nur durch autorisierte Methoden geändert werden können

#====
<!-- .slide: class="l-agenda" -->
# Sicherheit in klassischen IT-Landschaften

Prozesskommunikation systemintern

Identifizierung von Bedrohungen anhand von Signaturen

Relativ statischer Aufbau

Note:

- In traditionellen Anwendungen kommunizieren Prozesse hauptsächlich intern im RAM.
- Identifizierung von Bedrohungen anhand von Signaturen, Schlüsselwörtern und regulären Ausdrücken.
- Erkennung basierte auf "Deny Lists" (Sperrlisten)
- CVEs
- Verhaltensanalyse (Werden Verbindungen aufgebaut, ...)

#====
<!-- .slide: class="l-agenda" -->
# Sicherheit in containerbasierten Umgebungen

Prozesskommunikation über das Netzwerk

Dynamischer Aufbau

Note:

- Pods komme hinzu, Pods verschwinden, Adressierung
- Zero Trust zwischen Podgrenzen/allgemein

#====
<!-- .slide: class="l-agenda" -->
# Herausforderungen / Unterschiede dieser Umgebungen

Traditionelle Werkzeuge funktionieren nicht effektiv genug

Neue Angriffsflächen

Abstraktion

*Notwendigkeit* der Automation

Komplexität von Richtlinien

Note:

- Dynamik, Vernetzung der Prozesse
- Container Runtime, k8s, Pipelines, Image Registry, Container Hosts, ...
- Verlust von Sichtbarkeit durch Abstraktion in k8s
- manuelle Konfigurations- und Bestätigungsschritte in Pipelines kaum sinnvoll möglich
- Policies für Netzwerk, Prozess und Dateisystem

#====
<!-- .slide: class="l-agenda" -->
# Red Hat Advanced Cluster Security (RHACS)

Sieht alle Images, welche _verwendet_ werden und gleicht (CVE) Datenbanken ab

Prüfung bereits in CI/CD-Pipelines möglich

Prüft auch auf Host-Level (CoreOS)

Visualisiert den Datenverkehr

Note:

- Großer Funktionsumfang
- Policies nicht deklarativ über kubernetes API
- Kein Vulnerabulity Prozess
- legt Layer ab, vergleicht Vulnerability Datenbank
- eBPF
- Visualisierung in großen Umgebungen sehr träge
- Simulation von Network Policy Changes
- Scanner auf Basis von Clair v2
- Alpine, AMI, CentOS, RHEL, Ubuntu (SLES wird nicht explizit erwähnt)

#====
<!-- .slide: class="l-agenda" -->
# SUSE Security (NeuVector)

Ebenfalls: CVE-Abgleich, CI/CD-Pipeline-Integration, Host-Level-Security

Build- und Runtime Security-Lösung

Registry-Scanning

Data Loss Prevention ("Regex für Traffic")

Note:

- Standalone Scanning möglich
- Discover, Monitor, Protect Modes
- Zero Drift (bspw. 10 Tage Disovery, dann Protect)

#====
<!-- .slide: class="l-agenda" -->
# Fazit

Ähnlicher Funktionsumfang

Integrationen in SIEM, Registries, CI/CD

Visualisierung ausbaufähig

Note:

- RHACS und NV sind ähnliche Lösungen
- Verzahlung mit k8s Distributionen unterschiedlich (RHACS und OCP, NV eher unabhängig)
- NV mit WAF und DLP
- ACS mit Stärken bei Netzwerkrichtlinien und CI/CD (roxctl)
- ACS als Managed Cloud Dienst verfügbar
- NV Demo

#====
<!-- .slide: class="l-cover" -->
# Dankeschön!

@lubeka@mastodon.social

m.puzzle-itc.de/lkallies
