# Metadata Included

## Meta Features

The following features are included in the [`meta.db`](meta.db) database.

| Feature name      | Description |
| ----------------- | ----------- |
| `family`          | The family the benchmark instance belongs to |
| `submitted_in`    | The year the instance was submitted in |
| `optimal_cost`    | The optimal cost for the instance |
| `best_known_cost` | The best-known cost for the instance (found during a MSE) |
| `submitted_by`    | The name of the submitter |
| `submitted_as`    | The file name the instance was submitted as |
| `unsat`           | Whether the hard clauses are unsatisfiable |
| `disqualified`    | Whether the instance was disqualified from being used in the MSE (see [`scripts/disqualify`](scripts/disqualify)) |
| `used_in`         | The MSE tracks the instance was used in |

## Base Features

The base features are included in the [`base.db`](base.db) database.
They include the following data:

| Feature name                                    | Description |
| ----------------------------------------------- | ----------- |
| `h_clauses`                                     | Number of hard clauses |
| `variables`                                     | Number of variables |
| `h_cls[1-9]`                                    | Number of hard clauses of length \[1-9\] |
| `h_cls10p`                                      | Number of hard clasues of length >= 10 |
| `h_horn`                                        | Number of hard horn clauses |
| `h_invhorn`                                     | Number of hard inverse horn clauses |
| `h_positive`                                    | Number of hard positive clauses |
| `h_negative`                                    | Number of hard negative clauses |
| `h_hornvars_{mean,variance,min,max,entropy}`    | Distribution stats of variable occurrences in hard horn clauses |
| `h_invhornvars_{mean,variance,min,max,entropy}` | Distribution stats of variable occurrences in hard inverse horn clauses |
| `h_balancecls_{mean,variance,min,max,entropy}`  | Distribution stats of fractions of number of positive/negative literals in hard clauses |
| `h_balancevars_{mean,variance,min,max,entropy}` | Distribution stats of fractions of number of positive/negative literals of variables in hard clauses |
| `s_clauses`                                     | Number of soft clauses |
| `s_weight_sum`                                  | Sum of soft clause weights |
| `s_cls[1-9]`                                    | Number of soft clauses of length \[1-9\] |
| `s_cls10p`                                      | Number of soft clauses of length >=10 |
| `s_weight_{mean,variance,min,max,entropy}`      | Distribution stats of soft clause weights |
| `h_vcg_cdegree_{mean,variance,min,max,entropy}` | Hard variable-clause graph clause degree distribution stats |
| `h_vcg_vdegree_{mean,variance,min,max,entropy}` | Hard variable-clause graph variable degree distribution stats |
| `h_vg_degree_{mean,variance,min,max,entropy}`   | Hard variable graph degree distribution stats |
| `h_cg_degree_{mean,variance,min,max,entropy}`   | Hard clause graph degree distribution stats |
