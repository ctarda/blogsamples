/*
*   Service Layer. This is the lower layer in the app's
*   layer design. It knows about the specific way data
*   is stored in a particular service.
*/
class ConfigurationService {
    func getValue(key: String)->String {
        //attack configuration service and return the value
        return "valueForKey" + key
    }
    
    func getValues(keys: [String])->[String] {
        //attack configuration service and return the value
        return keys.map({return "valueForKey" + $0})
    }
    
    func getValue(key: String, defaultValue: String)->String {
        //attack configuration service and return the value
        return key
    }
}

/*
*   Business layer. This is the top layer, and provides
*   semantic, domain specific APIs. It uses the 
*   ConfigurationService
*/
class ConfigurationManager {
    private final let service = ConfigurationService()
    
    func getAuthenticationEndPoint()->String {
        //Do some business logic, like checking caches and wahtnot
        
        return service.getValue("authenticationEndPoint")
    }
    
    func getLocalCurrency()->String {
        //Do some business logic, like checking caches and wahtnot
        
        return service.getValue("localCurrency")
    }
    
    func getIconURLs()->[String] {
        let icons = ["menuIcon1", "menuIcon2", "menuIcon3"]
        
        return service.getValues(icons)
    }
}