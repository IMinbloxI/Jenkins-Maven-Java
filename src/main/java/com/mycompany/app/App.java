package com.mycompany.app;
import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;

/**
 * Hello world!
 */

public class App {

    private static final String MESSAGE = "Hello World!";

    public App() {}

    // public static void main(String[] args) {
        // System.out.println(MESSAGE);
    // }

    public String getMessage() {
        return MESSAGE;
    }

    public static void main(String[] args) throws Exception {
        String version = System.getenv().getOrDefault("APP_VERSION", "v1");
        boolean broken = "true".equals(System.getenv("FAIL"));
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/", ex -> {
            byte[] body = ("Hello from " + version + "\n").getBytes();
            ex.sendResponseHeaders(broken ? 500 : 200, body.length);
            ex.getResponseBody().write(body);
            ex.close();
        });
        server.start();
    }

}


