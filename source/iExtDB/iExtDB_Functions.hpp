class cfgFunctions {
	class iExtDB {
		class iExtDB_Main {
			file "\iExtDB\iExtDB_Functions\Main";
			class establishConnection {};
			class databaseASync {};
			class databaseQuery {};
		};
		class iExtDB_Calls {
			file "\iExtDB\iExtDB_Functions\Calls";
			class queryRequest {};
		};
		class iExtDB_Misc {
			file "\iExtDB\iExtDB_Functions\Misc";
			class log {};
		};
	};
};