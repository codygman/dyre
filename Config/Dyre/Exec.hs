{- |
That said, the functions defined here handle the messy business of
executing the custom binary on different platforms.
-}
module Config.Dyre.Exec ( customExec ) where

import System.Posix.Process ( executeFile )
import Config.Dyre.Params   ( Params(..) )
import Config.Dyre.Options  ( customOptions )

-- | Called when execution needs to be transferred over to
--   the custom-compiled binary.
customExec :: Params cfgType -> FilePath -> IO ()
customExec params@Params{statusOut = output} tempBinary = do
    output $ "Launching custom binary '" ++ tempBinary ++ "'\n"
    args <- customOptions Nothing
    executeFile tempBinary False args Nothing
