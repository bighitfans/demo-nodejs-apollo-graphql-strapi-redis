
module.exports = (err) => {
    //console.error('error -->', err)
    switch (err.status) {
        case 403:
            return {
                code: 'ELSP403',
                error: err
            }

        case 500:
            //we get 500 status if there is dup entry.
            return {
                code: 'ELSP01',
                error: err
            }

        case 404:
            return {
                code: 'ELSP404',
                error: err
            }


        default:
            return {
                code: 'ELSP99',
                error: err
            }
    }
}
