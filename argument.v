module main

const (
	default_flag_value = ''
)

struct ArgumentParserResults {
	mut:
	command string
	parameters map[string]string
}

fn create_argument_parser(arguments []string) int {
	mut results := ArgumentParserResults{}
	mut argument_index := 0
	for argument in arguments {
		if argument_index == 0 {
			results.command = argument
		}
		is_valid_command := argument.starts_with('--')
		if !is_valid_command {
			
		}

		argument_index += 1
	}
	return 0
}