# MaxSAT Evaluation Data

This repository contains data and scripts about the MaxSAT Evaluation
benchmarks and results.

> [!NOTE]
> All data in this repository refers to instances standardized with
> [`std_wcnf`](https://bitbucket.org/fbacchus/maxsat_benchmarks_code_base/) in
> the new WCNF format (post 2022) with unit weights adjusted to `1` and
> variable gaps closed (i.e., the output of `std_wcnf <inst>`).
> The exact instances used in previous MSEs might produce different hashes.
> To get the correct hash from old WCNF files, use
> `std_wcnf <inst> > /tmp/inst.wcnf && gbd hash /tmp/inst.wcnf`
> or similar.

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

For a description of the metadata included in the databases, see [`metadata.md`](metadata.md)
