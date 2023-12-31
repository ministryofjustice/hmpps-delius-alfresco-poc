{{/*
Create a default fully qualified name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "content-services.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "content-services.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" -}}
{{- end }}

{{- define "content-services.activemq.fullname" -}}
{{- $data := dict "Release" .Release "Values" .Values.activemq "Chart" (dict "Name" "activemq") }}
{{- include "activemq.fullname" $data }}
{{- end }}
