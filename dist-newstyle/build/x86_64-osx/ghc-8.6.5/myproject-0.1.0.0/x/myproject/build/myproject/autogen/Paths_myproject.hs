{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_myproject (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/rimikt/.cabal/bin"
libdir     = "/Users/rimikt/.cabal/lib/x86_64-osx-ghc-8.6.5/myproject-0.1.0.0-inplace-myproject"
dynlibdir  = "/Users/rimikt/.cabal/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/rimikt/.cabal/share/x86_64-osx-ghc-8.6.5/myproject-0.1.0.0"
libexecdir = "/Users/rimikt/.cabal/libexec/x86_64-osx-ghc-8.6.5/myproject-0.1.0.0"
sysconfdir = "/Users/rimikt/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "myproject_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myproject_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "myproject_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "myproject_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myproject_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myproject_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
