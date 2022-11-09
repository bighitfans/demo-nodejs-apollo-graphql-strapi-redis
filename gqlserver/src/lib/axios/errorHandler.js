
module.exports = (error) => {

    var utilError = {}
    if (error.response) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx
        throw {
            data: error.response.data,
            status: error.response.status,
            header: error.response.header,
            message: error.message,
        };

    } else if (error.request) {
        // The request was made but no response was received
        // `error.request` is an instance of XMLHttpRequest in the browser and an instance of
        // http.ClientRequest in node.js
        console.error('EAX001 Request', error.request);

    } else {
        // Something happened in setting up the request that triggered an Error
        console.log('Error', error.message);
        utilError.data = error.message;
    }
    console.log('EAX002 Config', error.config);

    throw {
        status: 599, //some major error
    };
}
