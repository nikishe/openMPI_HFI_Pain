//just an MPi Hell World script that runs for 5 minutes
//to allow user to count the HFI unit number
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#define RUN_DURATION 300 // Duration to run in seconds (5 minutes)

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if (rank == 0) {
        printf("Running MPI program with %d processes for %d seconds.\n", size, RUN_DURATION);
    }

    time_t start_time = time(NULL);
    time_t current_time;

    do {

        if (rank == 0) {
            printf("Process %d: still running...\n", rank);
        }

        MPI_Barrier(MPI_COMM_WORLD);

        usleep(500000); // Sleep for 500ms
        current_time = time(NULL);
    } while (difftime(current_time, start_time) < RUN_DURATION);

    if (rank == 0) {
        printf("Finished after %d seconds.\n", RUN_DURATION);
    }

    MPI_Finalize();
    return 0;
}