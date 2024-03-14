import pandas as pd
from dagster_deltalake import LocalConfig
from dagster_deltalake_pandas import DeltaLakePandasIOManager

from dagster import Definitions, SourceAsset, asset

harvest_data = SourceAsset(key="customers")

defs = Definitions(
    assets=[harvest_data],
    resources={
        "io_manager": DeltaLakePandasIOManager(
            root_uri="/data-lake/raw-data/hieuut",
            storage_options=LocalConfig(),
            schema="inventory",
        )
    },
)