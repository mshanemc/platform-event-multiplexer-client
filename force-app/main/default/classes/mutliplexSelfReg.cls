public with sharing class mutliplexSelfReg {

    public static string reg() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Multiplexer/sessionId');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');

        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('orgId', Userinfo.getOrganizationId());
        gen.writeStringField('sessionId', UserInfo.getSessionId());
        gen.writeStringField('serverUrl', Url.getSalesforceBaseUrl().toExternalForm());
        gen.writeEndObject();

        req.setBody(gen.getAsString());

        http http = new Http();
        HttpResponse res = http.send(req);
        system.debug(res.getBody());
        return res.getBody();
    }
}
