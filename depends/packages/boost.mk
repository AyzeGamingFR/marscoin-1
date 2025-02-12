package=boost
$(package)_version=1_70_0
$(package)_download_path=http://sourceforge.net/projects/boost/files/boost/1.70.0
$(package)_file_name=$(package)_$($(package)_version).tar.bz2
$(package)_sha256_hash=430ae8354789de4fd19ee52f3b1f739e1fba576f0aded0897c3c2bc00fb38778
$(package)_patches=darwin_boost_atomic-1.patch darwin_boost_atomic-2.patch

#define $(package)_set_vars
#$(package)_config_opts_release=variant=release
#$(package)_config_opts_debug=variant=debug
#$(package)_config_opts=--layout=tagged --build-type=complete 
#--user-config=project-config.jam
#$(package)_config_opts+=threading=multi link=static -sNO_BZIP2=1 -sNO_ZLIB=1
#$(package)_config_opts_linux=threadapi=pthread runtime-link=shared
#$(package)_config_opts_darwin=--toolset=darwin-4.2.1 runtime-link=shared
#$(package)_config_opts_mingw32=binary-format=pe target-os=windows threadapi=win32 runtime-link=static
#$(package)_config_opts_x86_64_mingw32=address-model=64
#$(package)_config_opts_i686_mingw32=address-model=32
#$(package)_config_opts_i686_linux=address-model=32 architecture=x86
#$(package)_toolset_$(host_os)=gcc
#$(package)_archiver_$(host_os)=$($(package)_ar)
#$(package)_toolset_darwin=darwin
#$(package)_archiver_darwin=$($(package)_libtool)
#$(package)_config_libraries=chrono,filesystem,program_options,system,thread,test
#$(package)_cxxflags=-fvisibility=hidden
#$(package)_cxxflags_linux=-fPIC
#endef

#define $(package)_preprocess_cmds
#  patch -p2 < $($(package)_patch_dir)/darwin_boost_atomic-1.patch && \
#  patch -p2 < $($(package)_patch_dir)/darwin_boost_atomic-2.patch && \
#  echo "using $(boost_toolset_$(host_os)) : : $($(package)_cxx) : <cxxflags>\"$($(package)_cxxflags) $($(package)_cppflags)\" <linkflags>\"$($(package)_ldflags)\" <archiver>\"$(boost_archiver_$(host_os))\" <striper>\"$(host_STRIP)\"  <ranlib>\"$(host_RANLIB)\" <rc>\"$(host_WINDRES)\" : ;" > user-config.jam
#endef

define $(package)_config_cmds
  ./bootstrap.sh 
#--without-icu --with-libraries=$(boost_config_libraries)
endef

define $(package)_build_cmds
  ./b2 
#--prefix=$($(package)_staging_prefix_dir) $($(package)_config_opts) 
endef

define $(package)_stage_cmds
  ./b2 install
#--prefix=$($(package)_staging_prefix_dir) $($(package)_config_opts) install
endef
