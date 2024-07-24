# TimeSeriesExtraction
Extracting timeseries from many models from point locations

**Developer:** Gen Tolhurst (E: gentolhurst@gmail.com)

**Supervised by:** Mitch Black (E: mitchell.black@bom.gov.au)

**Funded by:** ACS

## File descriptions
The bulk of the processing is done using this parallelised bash script [data_extraction.sh](https://github.com/AusClimateService/TimeSeriesExtraction/blob/main/data_extraction.sh)

Follow [data_extraction.ipynb](https://github.com/AusClimateService/TimeSeriesExtraction/blob/main/data_extraction.ipynb) for the process of extracting time series from many point locations.

The process constructs a csv for each location with daily tasmax, tasmin, and tasmean values from 13 models. This results in 3 x 13 columns of temperature data. The dataframe will look something like this:
![image](https://github.com/user-attachments/assets/2a82c212-7f4a-4b99-b953-2846653ed1f8)

[UCL_2021_AUST_with_location_top_33.csv](https://github.com/AusClimateService/TimeSeriesExtraction/blob/main/UCL_2021_AUST_with_location_top_33.csv) is an example of a list of point locations that were requested for time series extraction. From that csv file, we simplified the file to include only the location code, lon, and lat [UCL_2021_AUST_top_33_coords_only.csv](https://github.com/AusClimateService/TimeSeriesExtraction/blob/main/UCL_2021_AUST_top_33_coords_only.csv).

This notebook catalogues the ACS bias-adjusted data [acs_catalogue_data.ipynb](https://github.com/AusClimateService/TimeSeriesExtraction/blob/main/acs_catalogue_data.ipynb). This method leans heavily on code Gen previously developed at https://git.nci.org.au/pfd548/bom-climate-change-variability-and-extreme-toolbox/-/blob/master/catalog_builder.py.

Xarray can extract smaller time series using methods shown in [data_extraction_xr_example.ipynb](https://github.com/AusClimateService/TimeSeriesExtraction/blob/main/data_extraction_xr_example.ipynb)
