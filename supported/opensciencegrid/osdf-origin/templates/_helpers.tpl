{{/* vim: set filetype=mustache:et:sw=2:sts=2 */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "osdf-origin.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "osdf-origin.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "osdf-origin.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Check image.registry -- only specific ones are allowed.
Use "hub.opensciencegrid.org" as the default.
*/}}
{{- define "osdf-origin.origin-registry" -}}
{{- $okregistries := list "hub.opensciencegrid.org" "docker.io" -}}
  {{- with .Values.image -}}
    {{- if has (default "hub.opensciencegrid.org" .registry) $okregistries -}}
      {{- .registry -}}
    {{- else -}}
      {{- fail (cat "image.registry must be one of" (toString $okregistries) ) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}


{{/*
Check image.organization -- only specific ones are allowed.
Use "opensciencegrid" as the default.
*/}}
{{- define "osdf-origin.origin-organization" -}}
{{- $okorganizations := list "opensciencegrid" "matyasosg" -}}
  {{- with .Values.image -}}
    {{- if has (default "opensciencegrid" .organization) $okorganizations -}}
      {{- .organization -}}
    {{- else -}}
      {{- fail (cat "image.organization must be one of" (toString $okorganizations) ) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

