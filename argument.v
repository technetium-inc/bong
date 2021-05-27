module main

const (
	default_flag_value = ''
)

struct ArgumentParserResults {
	mut:
	command string
	parameters map[string]string
}

fn find_parameter_value(statement []string) (string, string) {
	command := statement[0]
	if statement.len == 1 {
		return command, default_flag_value
	}
	join_array := statement[1..]
	return command, join_array.join('=')
}

fn create_argument_parser(arguments []string) ArgumentParserResults {
	mut results := ArgumentParserResults{}
	mut argument_index := 0
	for argument in arguments {

		if argument_index == 0 {
			argument_index += 1
			results.command = argument
			continue
		}
		is_valid_command := argument.starts_with('--')
		if !is_valid_command {
			Exception{
				error : '$argument is not a valid flag'
			}.create(true)
		}
		statement := argument.split('=')
		command, params := find_parameter_value(statement)

		results.parameters[command] = params
		argument_index += 1
	}
	return results
}