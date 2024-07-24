# This script takes a coords file, a common path, and a variable 
# and makes a time series for each coordinate
# from year 1980 to 2099 using historical and ssp370 experiments
# from 13 BARPA-R and CCAM-v2202-SN downscaling models
# the only difference between the top and bottom sections of the code is the var
# this code is parallelised, please request large CPU resources
#-----

# for all locations
coords_file="/g/data/mn51/users/gt3409/TimeSeriesExtraction/UCL_2021_AUST_top_33_coords_only.csv"

commonpath="/g/data/ia39/australian-climate-service/test-data/CORDEX-CMIP6/bias-adjustment-output/AGCD-05i"
var="tasminAdjust"

{
read
while IFS="," read -r _ code lon lat
do
  (
    echo ${code} ${lon} ${lat}
    for i in BOM,ACCESS-CM2,BARPA-R,r4i1p1f1 BOM,ACCESS-ESM1-5,BARPA-R,r6i1p1f1 BOM,CESM2,BARPA-R,r11i1p1f1 BOM,CMCC-ESM2,BARPA-R,r1i1p1f1 BOM,EC-Earth3,BARPA-R,r1i1p1f1 BOM,MPI-ESM1-2-HR,BARPA-R,r1i1p1f1 BOM,NorESM2-MM,BARPA-R,r1i1p1f1 CSIRO,ACCESS-CM2,CCAM-v2203-SN,r4i1p1f1 CSIRO,ACCESS-ESM1-5,CCAM-v2203-SN,r6i1p1f1 CSIRO,CESM2,CCAM-v2203-SN,r11i1p1f1 CSIRO,CMCC-ESM2,CCAM-v2203-SN,r1i1p1f1 CSIRO,CNRM-ESM2-1,CCAM-v2203-SN,r1i1p1f2 CSIRO,EC-Earth3,CCAM-v2203-SN,r1i1p1f1
    do IFS=","
        set -- $i
        echo $1 $2 $3 $4 # institution_id, parent_model, downscaling_model, member_id    
        outfile="${var}_${code}_${1}_${2}_${3}_${4}_1980to2099.txt"
        if [ ! -f ${outfile} ]
        then
            for year in {1980..2014}
            do
                experiment_id="historical"
                ifile="${commonpath}/${1}/${2}/${experiment_id}/${4}/${3}/v1-r1-ACS-QME-AGCD-1960-2022/day/${var}/${var}_AGCD-05i_${2}_${experiment_id}_${4}_${1}_${3}_v1-r1-ACS-QME-AGCD-1960-2022_day_${year}0101-${year}1231.nc"
                cdo -outputtab,date,lon,lat,value -remapnn,"lon=${lon}_lat=${lat}" ${ifile} > temp_${var}_${code}_${year}.txt
                sed -i "2d" temp_${var}_${code}_${year}.txt
                sed -i "1d" temp_${var}_${code}_${year}.txt
            done
            for year in {2015..2099}
            do
                experiment_id="ssp370"
            	# ifile="${filepath}_${year}0101-${year}1231.nc"
                ifile="${commonpath}/${1}/${2}/${experiment_id}/${4}/${3}/v1-r1-ACS-QME-AGCD-1960-2022/day/${var}/${var}_AGCD-05i_${2}_${experiment_id}_${4}_${1}_${3}_v1-r1-ACS-QME-AGCD-1960-2022_day_${year}0101-${year}1231.nc"
             	cdo -outputtab,date,lon,lat,value -remapnn,"lon=${lon}_lat=${lat}" ${ifile} > temp_${var}_${code}_${year}.txt
                sed -i "2d" temp_${var}_${code}_${year}.txt
                sed -i "1d" temp_${var}_${code}_${year}.txt
            done 
            cat temp_${var}_${code}_{1980..2099}.txt > ${outfile}
            rm temp_${var}_${code}_{1980..2099}.txt
        fi
    done
  ) &
done } < ${coords_file}


#-----

# for all locations
coords_file="/g/data/mn51/users/gt3409/TimeSeriesExtraction/UCL_2021_AUST_top_33_coords_only.csv"

commonpath="/g/data/ia39/australian-climate-service/test-data/CORDEX-CMIP6/bias-adjustment-output/AGCD-05i"
var="tasmaxAdjust"

{
read
while IFS="," read -r _ code lon lat
do
  (
    echo ${code} ${lon} ${lat}
    for i in BOM,ACCESS-CM2,BARPA-R,r4i1p1f1 BOM,ACCESS-ESM1-5,BARPA-R,r6i1p1f1 BOM,CESM2,BARPA-R,r11i1p1f1 BOM,CMCC-ESM2,BARPA-R,r1i1p1f1 BOM,EC-Earth3,BARPA-R,r1i1p1f1 BOM,MPI-ESM1-2-HR,BARPA-R,r1i1p1f1 BOM,NorESM2-MM,BARPA-R,r1i1p1f1 CSIRO,ACCESS-CM2,CCAM-v2203-SN,r4i1p1f1 CSIRO,ACCESS-ESM1-5,CCAM-v2203-SN,r6i1p1f1 CSIRO,CESM2,CCAM-v2203-SN,r11i1p1f1 CSIRO,CMCC-ESM2,CCAM-v2203-SN,r1i1p1f1 CSIRO,CNRM-ESM2-1,CCAM-v2203-SN,r1i1p1f2 CSIRO,EC-Earth3,CCAM-v2203-SN,r1i1p1f1
    do IFS=","
        set -- $i
        echo $1 $2 $3 $4 # institution_id, parent_model, downscaling_model, member_id    
        outfile="${var}_${code}_${1}_${2}_${3}_${4}_1980to2099.txt"
        if [ ! -f ${outfile} ]
        then
            for year in {1980..2014}
            do
                experiment_id="historical"
                ifile="${commonpath}/${1}/${2}/${experiment_id}/${4}/${3}/v1-r1-ACS-QME-AGCD-1960-2022/day/${var}/${var}_AGCD-05i_${2}_${experiment_id}_${4}_${1}_${3}_v1-r1-ACS-QME-AGCD-1960-2022_day_${year}0101-${year}1231.nc"
                cdo -outputtab,date,lon,lat,value -remapnn,"lon=${lon}_lat=${lat}" ${ifile} > temp_${var}_${code}_${year}.txt
                sed -i "2d" temp_${var}_${code}_${year}.txt
                sed -i "1d" temp_${var}_${code}_${year}.txt
            done
            for year in {2015..2099}
            do
                experiment_id="ssp370"
            	# ifile="${filepath}_${year}0101-${year}1231.nc"
                ifile="${commonpath}/${1}/${2}/${experiment_id}/${4}/${3}/v1-r1-ACS-QME-AGCD-1960-2022/day/${var}/${var}_AGCD-05i_${2}_${experiment_id}_${4}_${1}_${3}_v1-r1-ACS-QME-AGCD-1960-2022_day_${year}0101-${year}1231.nc"
             	cdo -outputtab,date,lon,lat,value -remapnn,"lon=${lon}_lat=${lat}" ${ifile} > temp_${var}_${code}_${year}.txt
                sed -i "2d" temp_${var}_${code}_${year}.txt
                sed -i "1d" temp_${var}_${code}_${year}.txt
            done 
            cat temp_${var}_${code}_{1980..2099}.txt > ${outfile}
            rm temp_${var}_${code}_{1980..2099}.txt
        fi
    done
  ) &
done } < ${coords_file}



