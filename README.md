# MaxSAT Evaluation Data

This repository contains data and scripts about the MaxSAT Evaluation
benchmarks and results.

## Usage

The benchmark metadata is contained in GBD databases, which are SQLite database
files.
To store these databases in a `git` repository, we use smudge and clean
filters, so that database dumps are actually stored in `git`, rather than the
binary databases.
To configure these filters in your locally checked out repository, run the
following commands, and ensure that `sqlite3` is available on the `$PATH`.

```
git config filter.dumpsql.clean 'tmp=$(mktemp); cat > $tmp; sqlite3 $tmp .dump; rm $tmp'
git config filter.dumpsql.smudge 'tmp=$(mktemp); sqlite3 $tmp; cat $tmp; rm $tmp'
```

The repository is preconfigured with a Nix development environment, but all
data can also be accessed without Nix.
For `gbd` to work conveniently, the `$GBD_DB` environment variable needs to be
set.
The Nix environment set this variable to configure the databases contained in
this repository.
If you have a set of benchmark files locally and have a GBD database with paths
to the benchmarks initialized, preprend the path to this database before
`$GBD_DB`.
When using the Nix environment, this can easily be done by adding the following
line to `.env`.

```
echo 'export GBD_DB="<path to local db>:$GBD_DB"' >> .env
```
