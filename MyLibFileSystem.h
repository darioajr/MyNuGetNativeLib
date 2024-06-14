#pragma once

#include <iostream>

namespace MyLibStorage
{
	class FileSystem 
	{
	public: 
		static void listFolderContent(std::string path);
	};
	
}