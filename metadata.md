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

## Families

Mappings of families to descriptions in the proceedings, where available.

| Name                                                 | Year | Proceedings                             |
| ---------------------------------------------------- | ---- | --------------------------------------- |
| `approximately-propagation-complete`                 | 2018 | https://hdl.handle.net/10138/237139 p38 |
| `argumentation-framework-synthesis`                  | 2017 | https://hdl.handle.net/10138/228949 p23 |
| `balanced-classification-rules`                      | 2024 | https://hdl.handle.net/10138/584878 p36 |
| `bio-repair`                                         | 2017 | https://hdl.handle.net/10138/228949 p27 |
| `bnn-verification`                                   | 2020 | https://hdl.handle.net/10138/318451 p37 |
| `c-inference`                                        | 2024 | https://hdl.handle.net/10138/584878 p30 |
| `causal-discovery`                                   | 2017 | https://hdl.handle.net/10138/228949 p31 |
| `coalition-structure-generation`                     | 2020 | https://hdl.handle.net/10138/318451 p46 |
| `consistency-query-answering`                        | 2019 | https://hdl.handle.net/10138/306989 p34 |
| `css-refactoring`                                    | 2017 | https://hdl.handle.net/10138/228949 p20 |
| `dalculus`                                           | 2017 | https://hdl.handle.net/10138/228949 p27 |
| `decission-trees`                                    | 2021 | https://hdl.handle.net/10138/333649 p39 |
| `drmx-atmostk`                                       | 2018 | https://hdl.handle.net/10138/237139 p30 |
| `drmx-cryptogen`                                     | 2018 | https://hdl.handle.net/10138/237139 p31 |
| `exploit-synthesis`                                  | 2020 | https://hdl.handle.net/10138/318451 p49 |
| `extension-enforcement`                              | 2017 | https://hdl.handle.net/10138/228949 p23 |
| `generalized-hypertree-width`                        | 2017 | https://hdl.handle.net/10138/228949 p22 |
| `generalized-ising-model`                            | 2017 | https://hdl.handle.net/10138/228949 p33 |
| `iam-privilege-escalation-repair`                    | 2024 | https://hdl.handle.net/10138/584878 p41 |
| `inconsistency-measurement`                          | 2023 | https://hdl.handle.net/10138/564026 p31 |
| `interpretaable-rule-based-classifiers`              | 2019 | https://hdl.handle.net/10138/306989 p41 |
| `judgment-aggregation`                               | 2023 | https://hdl.handle.net/10138/564026 p33 |
| `large-graph-community-detection`                    | 2019 | https://hdl.handle.net/10138/306989 p42 |
| `large-graph-community-detection`                    | 2020 | https://hdl.handle.net/10138/318451 p55 |
| `lisbon-wedding`                                     | 2017 | https://hdl.handle.net/10138/228949 p25 |
| `max-realizability-power-distribution-full`          | 2018 | https://hdl.handle.net/10138/237139 p33 |
| `max-realizability-power-distribution-sparse`        | 2018 | https://hdl.handle.net/10138/237139 p33 |
| `max-realizability-robot-navigation`                 | 2018 | https://hdl.handle.net/10138/237139 p33 |
| `maximum-common-subgraph`                            | 2019 | https://hdl.handle.net/10138/306989 p44 |
| `maximum-probability-minimum-cut-set`                | 2020 | https://hdl.handle.net/10138/318451 p39 |
| `metro`                                              | 2017 | https://hdl.handle.net/10138/228949 p27 |
| `minimizing-pentagons`                               | 2024 | https://hdl.handle.net/10138/584878 p38 |
| `minimum-fill-in`                                    | 2017 | https://hdl.handle.net/10138/228949 p37 |
| `minimum-width-confidence-band`                      | 2017 | https://hdl.handle.net/10138/228949 p38 |
| `optimizing-bdds`                                    | 2023 | https://hdl.handle.net/10138/564026 p37 |
| `parametric-role-based-access-control-management`    | 2019 | https://hdl.handle.net/10138/306989 p43 |
| `parametric-role-based-access-control-management`    | 2020 | https://hdl.handle.net/10138/318451 p47 |
| `pareto-optimal-interpretation-synthesis`            | 2023 | https://hdl.handle.net/10138/564026 p34 |
| `pareto-optimal-interpretation-synthesis`            | 2024 | https://hdl.handle.net/10138/584878 p33 |
| `phylogenetic-trees`                                 | 2020 | https://hdl.handle.net/10138/318451 p51 |
| `planning-bnn`                                       | 2021 | https://hdl.handle.net/10138/333649 p32 |
| `program-disambiguation`                             | 2020 | https://hdl.handle.net/10138/318451 p58 |
| `quantum-circuit`                                    | 2022 | https://hdl.handle.net/10138/347396 p37 |
| `rail`                                               | 2020 | https://hdl.handle.net/10138/318451 p56 |
| `railway-timetabling`                                | 2020 | https://hdl.handle.net/10138/318451 p53 |
| `rna-alignment`                                      | 2017 | https://hdl.handle.net/10138/228949 p29 |
| `role-based-access-control-user-authorization-query` | 2018 | https://hdl.handle.net/10138/237139 p41 |
| `role-based-access-control-user-authorization-query` | 2020 | https://hdl.handle.net/10138/318451 p63 |
| `security-critical-cyber-physical-components`        | 2019 | https://hdl.handle.net/10138/306989 p36 |
| `security-weakness-witnesses`                        | 2020 | https://hdl.handle.net/10138/318451 p44 |
| `shift-design`                                       | 2017 | https://hdl.handle.net/10138/228949 p27 |
| `single-cell-dna-sequencing`                         | 2020 | https://hdl.handle.net/10138/318451 p60 |
| `single-machine-scheduling`                          | 2020 | https://hdl.handle.net/10138/318451 p54 |
| `steiner-triple-system`                              | 2020 | https://hdl.handle.net/10138/318451 p57 |
| `switching-activity-maximization`                    | 2021 | https://hdl.handle.net/10138/333649 p41 |
| `team-composition`                                   | 2018 | https://hdl.handle.net/10138/237139 p35 |
| `timetabling`                                        | 2017 | https://hdl.handle.net/10138/228949 p27 |
| `university-course-timtabling`                       | 2021 | https://hdl.handle.net/10138/333649 p37 |
| `visibly-pushdown-automata`                          | 2018 | https://hdl.handle.net/10138/237139 p39 |
| `xai-mindset`                                        | 2018 | https://hdl.handle.net/10138/237139 p43 |
