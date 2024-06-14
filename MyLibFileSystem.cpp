#include "MyLibFileSystem.h"

#include <boost/filesystem.hpp>
namespace fs = boost::filesystem;

namespace MyLibStorage
{
	void FileSystem::listFolderContent(std::string path)
	{
        fs::path dir_path(path);

        if (fs::exists(dir_path) && fs::is_directory(dir_path)) {
            std::cout << "List: " << dir_path << std::endl;

            for (const auto& entry : fs::directory_iterator(dir_path)) {
                std::cout << entry.path().string() << std::endl;
            }
        }
        else {
            std::cerr << "Directory not found or not a valid directory." << std::endl;
        }
	}
}