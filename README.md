# rust-crates

A repository which sets up the rust crates accordingly as submodules.

# Clone the repository

You can clone the submodules while cloning this repo with the following command.
Change the clone url from the SSH to HTTPS if you prefer that.

```bash
git clone --recurse-submodules git@github.com:ISM-Thesis-MultiRobot-Partitioning/rust-crates.git
```

# Run the solution

The container uses Rust 1.70, so the bug mentioned in the [`partition-api`][pa] is not present here.

```bash
docker build -t partition-api .
docker run partition-api
```

Note that the process appears impossible to kill using `ctrl+c` in this case. You may attempt to kill it using `docker stop` or `docker kill`. Also check `docker ps` to obtain relevant data for both of these commands.

[pa]: https://github.com/ISM-Thesis-MultiRobot-Partitioning/partition-api
