# Ops Manager Documentation Book

This repository contains metadata for the CredHub documentation. We publish the CredHub documentation at
https://docs.pivotal.io/credhub/index.html.

## How To Contribute

Please help us improve the accuracy and completeness of the CredHub documentation by contributing content, editing,
or expertise.

A common way to contribute is to file a pull request through GitHub.

Every topic in the CredHub documentation has a corresponding file in the
[https://github.com/pivotal-cf/docs-credhub](https://github.com/pivotal-cf/docs-credhub) content repository in
GitHub. To locate the source file for a topic, navigate to the topic on the CredHub documentation site and click
"View the source for this page in GitHub" at the bottom of the topic.

## Versions and Branching

| **Branch Name** | **Content** | **Location** |
|-----------------|-------------|--------------|
| `master` | CredHub (all versions)  | https://docs.pivotal.io/credhub/ |


**master**: The `master` branch is used to publish the live version of the site for all versions of CredHub. Create
pull requests on `master` to contribute or correct technical inaccuracies in
documentation.

## How To Use Bookbinder To View Your Documentation

[Bookbinder](https://github.com/pivotal-cf/bookbinder/blob/main/README.md) is a command-line
utility for stitching Markdown documents into a hostable web app. The documentation team uses
Bookbinder to publish our documentation sites, but you can also use Bookbinder to view a live
version of your documentation on your local machine.

Bookbinder draws the content for the site from this repository, the left navigation menu ("subnav")
from [docs-book-om](https://github.com/pivotal-cf/docs-book-om), and various layout
configuration and assets from [docs-layout-repo](https://github.com/pivotal-cf/docs-layout-repo).

To use Bookbinder to view your documentation, perform the following steps:

1. Clone this repository to the `~/workspace` directory on your local machine.
1. Clone the [docs-credhub](https://github.com/pivotal-cf/docs-credhub) and
[docs-layout-repo](https://github.com/pivotal-cf/docs-layout-repo) repositories to the `~/workspace` directory on your
local machine.
1. Navigate into the `docs-book-credhub` directory.
1. Run `bundle install` to install all of the necessary gems, including Bookbinder.
1. Run `bundle exec bookbinder bind local` to build a Rack web-app of the book. After the bind has completed, navigate
into the `final_app` directory and run `rackup`. Then navigate to `localhost:9292/credhub/index.html` in a
browser.

## Continuous Integration and Continuous Delivery

We use Concourse pipelines to provide continuous integration and continuous delivery. Any change made to this repository
or the [https://github.com/pivotal-cf/docs-credhub] content repository trigger a "bind" where the disparate parts of
the CredHub documentation are assembled into a single web app. A successful bind triggers pushing the app to the
staging site,
[https://docs-pcf-staging.cfapps.io/credhub](http://docs-pcf-staging.cfapps.io/credhub). After
review, the staging site is manually pushed to the production site,
[https://docs.pivotal.io/credhub/](https://docs.pivotal.io/credhub/).

Concourse Pipelines:

* **master**: https://concourse.run.pivotal.io/teams/cf-docs/pipelines/credhub
