module main

import os { args, is_file, read_file }

fn source_from_file(filename string) string {
	if !is_file(filename) {
		Exception{
			error: '$filename is not a file'
		}.create(true)
	}
	file_content := read_file(filename) or { panic(err) }

	return file_content
}

fn perform_arguments(results ArgumentParserResults) {
	if results.command == 'lol' {
	} else {
		source := remove_source_comments(source_from_file(results.command))
		mut process := BfProcess{
			memory: [0]
			data: source
		}
		process.execute()
	}
}

fn main() {
	argument_parser := create_argument_parser(args[1..])
	perform_arguments(argument_parser)
}
