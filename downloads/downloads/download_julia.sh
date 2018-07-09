get_url(){
  platform="$1/$2"
  version=$3
  base_url="https://julialang-s3.julialang.org/bin/$platform/${version%.*}/julia-$version"

  if [[ "$platform" == "linux/x86" ]]; then
    julia_url="$base_url-linux-i686.tar.gz"
  elif [[ "$platform" == "linux/x64" ]]; then
    julia_url="$base_url-linux-x86_64.tar.gz"
  elif [[ "$platform" == "linux/armv7l" ]]; then
    julia_url="$base_url-linux-armv7l.tar.gz"
  elif [[ "$platform" == "linux/aarch64" ]]; then
    julia_url="$base_url-linux-aarch64.tar.gz"
  elif [[ "$platform" == "winnt/x86" ]]; then
    julia_url="$base_url-win32.exe"
  elif [[ "$platform" == "winnt/x64" ]]; then
    julia_url="$base_url-win64.exe"
  elif [[ "$platform" == "freebsd/x64" ]]; then
    julia_url="$base_url-freebsd-x86_64.tar.gz"
  elif [[ $platform == "source/any" ]]; then
    julia_url="https://github.com/JuliaLang/julia/releases/download/v$version/julia-$version.tar.gz"
  fi
  echo $julia_url
}

download(){
  echo "Download: $1"
  wget $1
}

download_julia(){
  echo "Start to Download $1 from julialang server"
  for arch in "x86" "x64"; do

    for platform in "linux" "winnt" "freebsd"; do
      url="$(get_url $platform $arch $1)"
      download $url
      if [[ $platform == "linux" || $platform == "freebsd" ]]; then
        download "$url.asc"
      fi
    done

  done

  url="$(get_url linux armv7l $1)"
  download $url
  download "$url.asc"

  url="$(get_url linux aarch64 $1)"
  download $url
  download "$url.asc"

  url="$(get_url "source" any $1)"
  download $url
  download "$url.asc"

  url="https://github.com/JuliaLang/julia/releases/download/v$1/julia-$1-full.tar.gz"
  download $url
  download "$url.asc"
}

download_julia 0.6.3
download_julia 0.7.0-beta
