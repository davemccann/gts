include "PremakeDependencies.lua"

project "gts"
    flags "FatalWarnings"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

    targetdir ("bin/" .. ConfigOutputPath)
    objdir ("bin-obj/" .. ConfigOutputPath)

    configmap {
      ["Debug"] = "DebugStatic",
      ["Release"] = "ReleaseStatic"
    }

    includedirs {
        "source/gts/include",
    }

    files {
        "source/config.h",
        "source/gts/include/**.*",
        "source/gts/source/**.*"
    }

    filter "platforms:x64"
      system "Windows"

    filter "configurations:Debug*"
      runtime "Debug"
      symbols "On"

    filter "configurations:Release*"
      optimize "Speed"
      runtime "Release"