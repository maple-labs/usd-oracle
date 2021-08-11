#!/usr/bin/env bash
set -e

while getopts v: flag
do
    case "${flag}" in
        v) version=${OPTARG};;
    esac
done

echo $version

./build.sh -c ./config/prod.json

rm -rf ./package
mkdir -p package

echo "{
  \"name\": \"@maplelabs/usd-oracle\",
  \"version\": \"${version}\",
  \"description\": \"USD Oracle Artifacts and ABIs\",
  \"author\": \"Maple Labs\",
  \"license\": \"AGPLv3\",
  \"repository\": {
    \"type\": \"git\",
    \"url\": \"https://github.com/maple-labs/usd-oracle.git\"
  },
  \"bugs\": {
    \"url\": \"https://github.com/maple-labs/usd-oracle/issues\"
  },
  \"homepage\": \"https://github.com/maple-labs/usd-oracle\"
}" > package/package.json

mkdir -p package/artifacts
mkdir -p package/abis

cat ./out/dapp.sol.json | jq '.contracts | ."contracts/UsdOracle.sol" | .UsdOracle' > package/artifacts/UsdOracle.json
cat ./out/dapp.sol.json | jq '.contracts | ."contracts/UsdOracle.sol" | .UsdOracle | .abi' > package/abis/UsdOracle.json

npm publish ./package --access public

rm -rf ./package
