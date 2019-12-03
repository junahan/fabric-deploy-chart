{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "fabric-deploy-flow.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fabric-deploy-flow.fullname" -}}
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
{{- define "fabric-deploy-flow.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "fabric-deploy-flow.labels" -}}
app.kubernetes.io/name: {{ include "fabric-deploy-flow.name" . }}
helm.sh/chart: {{ include "fabric-deploy-flow.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{/*
    peerOrgs, ordererOrgs 
*/}}
{{- define "fabric-deploy-flow.consortium.peerOrgs" }}
{{- $peerOrgs := "" }}
{{- range $i, $org := .Values.consortium.peerOrgs }}
{{- $peerOrgs = printf "%s,%s" $org.name $peerOrgs }}
{{- end }}
{{- printf "%s" $peerOrgs }}
{{- end }}

{{- define "fabric-deploy-flow.consortium.ordererOrgs" }}
{{- $ordererOrgs := "" }}
{{- range $i, $org := .Values.consortium.ordererOrgs }}
{{- $ordererOrgs = printf "%s,%s" $org.name $ordererOrgs }}
{{- end }}
{{- printf "%s" $ordererOrgs }}
{{- end }}

{{- define "fabric-deploy-flow.target.orderer" }}
{{- $ordererPeer := "" }}
{{- $ordererOrgs := "" }}
{{- $ordererPeer = .Values.consortium.ordererOrgs | first | pluck "nodes" | first | first }}
{{- $ordererOrgs = .Values.consortium.ordererOrgs | first | pluck "name" | first }}
{{- printf "%s.%s.%s" $ordererPeer $ordererOrgs "svc.cluster.local" }}
{{- end }}