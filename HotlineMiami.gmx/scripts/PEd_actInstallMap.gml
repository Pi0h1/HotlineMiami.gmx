/// PEd_actInstallMap(file)
/**
 * @brief Copies given map file to platform specific saving/loading directory.
 * @param {string} file The name of the file to install.
 */
gml_pragma("forceinline");
file_copy(argument0, string_replace(argument0, filename_dir(argument0) + "\", ""));
