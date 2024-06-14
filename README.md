# MyNuGetNativeLib
Visual Studio 2022 C++ Static Lib (Native) with NuGet packaging


## How to build NuGet package
1. **Dependencies**: Install Windows x86 Commandline nuget.exe from [NuGet website](https://www.nuget.org/downloads) and put it in the path.
2. **Execute the build**: Call Powershell script to build NuGet package locally (default: c:\nuget.local).
```bash
.\build.ps1
```

## How to use this library
1. **Register the new Package source on Nuget Package Manager Option**: In Visual Studio 2022 Options, register the new nuget.local as a local repository. 
(Don't forget to select All in the package source on the Package Management screen for the solution when searching for local packages)
2. **Create a new project to test the lib**:
```cpp
#include "MyLibFileSystem.h"

int main() {
    MyLibStorage::FileSystem::listFolderContent("c:\\temp");
    return 0;
}
```

# NuGet for Native Libraries in C++

In addition to being widely used for package management on the .NET platform, NuGet also offers robust support for native C++ libraries. This extends its reach and utility, allowing C++ developers to enjoy the same ease of dependency management and package distribution that .NET developers have benefited from.

## Support for Native Libraries

NuGet supports packages containing native C++ libraries, facilitating the integration of C++ code into projects that use other languages supported by NuGet, such as C#. Native packages can include `.h` (headers), `.lib` (libraries), and `.dll` (dynamic link libraries) files, as well as other necessary assets.

## Key Features for C++

1. **Dependency Management**: Just like in .NET applications, NuGet automatically manages dependencies for C++ packages, ensuring all necessary libraries are downloaded and configured correctly.

2. **Simplified Project Configuration**: Developers can easily add native NuGet packages to their C++ projects in Visual Studio, simplifying the process of setting up include paths and libraries, as well as configuring build properties.

3. **Integration with CMake**: For projects using CMake, NuGet facilitates the inclusion of packages and the setup of the build environment, integrating NuGet packages directly into CMake scripts.

4. **Multi-Platform Packages**: NuGet allows for the creation and distribution of packages that work across multiple platforms, such as Windows, Linux, and macOS. This is particularly useful for developers who need to support multiple platforms with their C++ libraries.

## How It Works for C++

To use NuGet with C++ libraries, developers can create packages containing header files and compiled libraries. These packages are then published to a NuGet repository, from where they can be installed in other projects.

The installation and update process is simple:

1. **Search and Installation**: Using the NuGet Package Manager in Visual Studio, developers can search for and install packages of native C++ libraries.
2. **Automatic Configuration**: NuGet automatically configures the project, adjusting include paths and libraries as necessary.
3. **Updates**: Keeping packages up to date is easy, with NuGet managing versions and dependencies to ensure the project always uses the latest and most stable libraries.

## Benefits of Using NuGet for C++

- **Development Efficiency**: Automates the inclusion of libraries and their dependencies, saving developers time and effort.
- **Ease of Maintenance**: Simplifies the process of updating libraries, ensuring projects use the latest and most bug-free versions.
- **Simplified Distribution**: Makes it easier to share C++ libraries between different projects and teams, promoting code reuse.

## Conclusion

NuGet is not only a powerful tool for the .NET ecosystem but also an efficient solution for managing native C++ libraries. It brings the same advantages of simplicity, efficiency, and centralized maintenance to C++ development, allowing developers to focus more on writing code and less on managing dependencies. With its robust support and easy integration, NuGet stands out as an indispensable tool for any C++ developer looking to optimize their workflow.
