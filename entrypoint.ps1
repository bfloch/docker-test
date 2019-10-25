param( $repo, $commit )

echo "Testing $repo at $commit"

# Verify cmake
cmake.exe --version

#Verify pwsh
pwsh --version

#Verify git
git --version

#Verify python
python --version


# Clone repo
git clone https://github.com/$repo rez
cd rez
git checkout $commit

# Install rez
mkdir build
python install.py build

#Run Rez Tests
.\build\Scripts\rez\rez-selftest.exe
