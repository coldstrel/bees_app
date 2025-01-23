# WS2 Reproducible Pipelines 
## University of Luxembourg
### FERNANDEZ FRAGOSO Aldo Enrique

For this project we use the dataset on __US Honey Production 1995-2021__ 🐝🐝 from Kaggle, which can be found here: [Honey Bee Dataset](https://www.kaggle.com/datasets/mohitpoudel/us-honey-production-19952021). This project is built into the package __myProject__ which is in the following [Github Repository](https://github.com/coldstrel/Package_FERNANDEZ).

For more info on the dataset you can consult on [Github Data DOCUMENTATION](https://github.com/coldstrel/Package_FERNANDEZ/blob/main/man/US_honey_dataset_updated.Rd) or after cloning the repository and opening the project on R and use `renv::restore()` to install the libraries on the _renv.lock_ file use `help(honey_data)`.

### Dockerized project

To run the shiny app _Docker_ must be installed on your computer.

1) Clone the repository:

    ```
    git clone https://github.com/coldstrel/bees_app
    ```

2) Build the image (Dockerfile), for this you have to bee inside the "bees_app" directory, otherwise an error will appear.

    ```
    docker build -t bees_shiny_app .
    ``` 

3) Run the docker

    ```
    docker run -d -p 3838:3838 --name bees_shiny_app bees_shiny_app
    ```

4) Go to [Shiny App](http://localhost:3838/) (localhost::3838) to run the shiny app.

You can select over 3 plots and different variables

![alt text](/imgs/image.png)

### Docker files

The first image that loads libraries and _myProject_ package is in the GitHub repository inside the __docker_baseline/Dockerfile(baseline)__ directory.

The Docker image for the shiny app is in the root directory under the name __Dockerfile__ this file contains what is needed to deploy the shiny app.

### GitHub Actions

Also __GitHub actions__ were implemented and they work when there is a _push_ or _pull request_ what they do is 6 steps:

1) Checkout the code
2) Set up Docker
3) Build Docker Image
4) Run the container for testing
5) Test the app
6) Stop and remove the container

### Future work

- Host the app on [shinyapps](https://www.shinyapps.io/)