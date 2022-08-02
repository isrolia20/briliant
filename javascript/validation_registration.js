const response = (message, statuses) => {
	return {
		message: message || "Kolom tidak boleh kosong !",
		status: statuses || false,
	};
};
const validation = (params, type) => {
	if (params !== "") {
		switch (type) {
			case "password":
				if (params.password !== params.repassword) {
					return response("Password dan confirm password tidak sama");
				}
				return response(null, true);
      case "text":
        if(params[0] === " "){
          return response("Field tidak boleh spasi di awal");
        }
        return response(null, true);
		}
	} else {
		return response(null, false);
	}
};
