# Ops Manager Documentation Book

This repository contains metadata for the Ops Manager documentation. We publish the Ops Manager documentation at
https://docs.pivotal.io/ops-manager/index.html.

## How To Contribute

Please help us improve the accuracy and completeness of the Ops Manager documentation by contributing content, editing,
or expertise.

A common way to contribute is to file a pull request through GitHub.

Every topic in the Ops Manager documentation has a corresponding file in the
[https://github.com/pivotal-cf/docs-ops-manager](https://github.com/pivotal-cf/docs-ops-manager) content repository in
GitHub. To locate the source file for a topic, navigate to the topic on the Ops Manager documentation site and click
"View the source for this page in GitHub" at the bottom of the topic.

## Versions and Branching

| **Branch Name** | **Content** | **Location** |
|-----------------|-------------|--------------|
| `edge` | Ops Manager pre-release | https://docs-pcf-staging.cfapps.io/ops-manager/2-11/index.html |
| `master` | Ops Manager v2.6 - v2.10  | https://docs.pivotal.io/ops-manager/2-10/index.html and others |

**edge**: The `edge` branch is used to publish the pre-release v2.11 version of the site. Create pull requests on
`edge` to contribute bug fixes or correct technical inaccuracies in the pre-release v2.11 documentation.

**master**: The `master` branch is used to publish the live version of the site for v2.6, v2.7, v2.8, v2.9, and v2.10. Create
pull requests on `master` to contribute or correct technical inaccuracies in the Ops Manager v2.6, v2.7, v2.8, v2.9 and v2.10
documentation.

## How To Use Bookbinder To View Your Documentation

[Bookbinder](https://github.com/pivotal-cf/bookbinder/blob/master/README.md) is a command-line
utility for stitching Markdown documents into a hostable web app. The documentation team uses
Bookbinder to publish our documentation sites, but you can also use Bookbinder to view a live
version of your documentation on your local machine.

Bookbinder draws the content for the site from this repository, the left navigation menu ("subnav")
from [docs-book-om](https://github.com/pivotal-cf/docs-book-om), and various layout
configuration and assets from [docs-layout-repo](https://github.com/pivotal-cf/docs-layout-repo).

To use Bookbinder to view your documentation, perform the following steps:

1. Clone this repository to the `~/workspace` directory on your local machine.
1. Clone the [docs-ops-manager](https://github.com/pivotal-cf/docs-ops-manager) and
[docs-layout-repo](https://github.com/pivotal-cf/docs-layout-repo) repositories to the `~/workspace` directory on your
local machine.
1. Navigate into the `docs-book-om` directory.
1. Run `bundle install` to install all of the necessary gems, including Bookbinder.
1. Run `bundle exec bookbinder bind local` to build a Rack web-app of the book. After the bind has completed, navigate
into the `final_app` directory and run `rackup`. Then navigate to `localhost:9292/ops-manager/index.html` in a
browser.

## Continuous Integration and Continuous Delivery

We use Concourse pipelines to provide continuous integration and continuous delivery. Any change made to this repository
or the [https://github.com/pivotal-cf/docs-ops-manager] content repository trigger a "bind" where the disparate parts of
the Ops Manager documentation are assembled into a single web app. A successful bind triggers pushing the app to the
staging site,
[https://docs-pcf-staging.cfapps.io/ops-manager](http://docs-pcf-staging.cfapps.io/ops-manager). After
review, the staging site is manually pushed to the production site,
[https://docs.pivotal.io/ops-manager/](https://docs.pivotal.io/ops-manager/).

Concourse Pipelines:

* **master**: https://concourse.run.pivotal.io/teams/cf-docs/pipelines/om
* **edge**: https://concourse.run.pivotal.io/teams/cf-docs/pipelines/om?group=edge
