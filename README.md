# Helm Charts
Helm Charts for OSG and contributed software

These are Helm charts used for services either centrally managed by OSG Staff, or provided by OSG Staff and contributors for use by sites.
These charts will be served from the OSG Harbor instance at hub.opensciencegrid.org.

Many images used by these Helm charts are from the [opensciencegrid/images repo](https://github.com/opensciencegrid/images).

## Layout

The top-level directories are `supported` and `contrib`.
They indicate the level of support that the charts underneath get.
Charts in the `supported` directory are supported by OSG Staff.
Charts in the `contrib` directory are supported by contributors.

Below that, the directories are `PROJECT/CHART` where `PROJECT` denotes the Harbor project that the chart is under,
and `CHART` denotes the chart name.
For example, `/supported/opensciencegrid/osdf-origin` is the path to the `osdf-origin` chart in the `opensciencegrid` project,
and is supported by OSG Staff.

## Conventions

All Helm charts are *required* to have 3 numbers in their version (x.y.z).
Use of [Semantic Versioning](https://semver.org) is recommended.
