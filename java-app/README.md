# Sample Java App
This is a dummy Java Application

## **Prerequisites**

**Utilities**:  
   - Java 17  
   - Maven 

## **Build**

1. **Build Application**:  
   - To create a build of java application using mave:  
     ```bash
      mvn clean package
     ```
2. **Run Application**
   - To run application 
     ```bash
     java -jar target/sample-0.0.1-SNAPSHOT.jar
     ```

## **Docker Image**
   - To create docker image

    ```
    docker build -t <image-name>:<version> .
    ```

   - Run Docker container

    ```
    docker run -d -p <desired-port>:8080 <image-name>
    ```