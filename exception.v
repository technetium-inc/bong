module main

struct Exception {
	error string
	file string
	line_number int
}

fn (exception Exception) create(is_fatal bool) {
	println('ERROR:${exception.error}')
	mut suggestion_string := ''
	if exception.file {
		suggestion_string += 'In ${exception.file} '
	}

	if exception.line_number {
		suggestion_string += "at ${exception.line_number}"
	}

	if is_fatal {
		exit(1)
	}
}