FROM nvcr.io/nvidia/l4t-base:r32.3.1

MAINTAINER Genis Virgili <genis.virgili@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran libpng-dev python3-pip pkg-config
RUN export CPATH="/usr/include/hdf5/serial/"
RUN ln -s /usr/lib/aarch64-linux-gnu/libhdf5_serial.so.100 /usr/lib/aarch64-linux-gnu/libhdf5.so
RUN ln -s /usr/lib/aarch64-linux-gnu/libhdf5_serial.so.100.0.1 /usr/lib/aarch64-linux-gnu/libhdf5_hl.so
RUN pip3 install pip testresources setuptools Cython

#RUN pip3 install numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11 google-pasta scipy

RUN pip3 install numpy future mock h5py keras_preprocessing \
	keras_applications gast futures protobuf pybind11 \
	termcolor google-pasta protobuf astor tensorflow-estimator \
	six grpcio opt-einsum tensorboard wheel keras-preprocessing \
	scipy gast absl-py keras-applications wrapt

RUN pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 tensorflow
RUN pip3 install matplotlib pandas jupyterlab

EXPOSE 8888 6006

RUN mkdir -p /notebooks

CMD ["jupyter-lab", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--notebook-dir='/notebooks'"]
