%module(directors="1") opensimSimbody
 // %module opensimSimbody

#pragma SWIG nowarn=822,451,503,516,325,401

%include java_exception.i

%{
#include <SimTKsimbody.h>
#include <OpenSim/Common/Object.h>
#include <OpenSim/Common/ObjectGroup.h>

using namespace SimTK;
%}

/* This file is for creation/handling of arrays */
%include "arrays_java.i";

%typemap(javacode) SimTK::Vec3 %{
    double[] getAsJavaArray() {
		return new double[]{this->get(0), this->get(1), this->get(2)};
	}
%}

%extend  SimTK::DecorativeGeometry {
public:
	bool hasUserRef() const {
		return (self->getUserRef()!=0);
	}

	OpenSim::Object& getUserRefAsObject() {
		return *((OpenSim::Object*)self->getUserRef());
	}
}

%extend SimTK::DecorativeMeshFile {
     SimTK::DecorativeMeshFile* clone() { 
         return new SimTK::DecorativeMeshFile(*self); 
     }
}

%extend SimTK::DecorativeSphere {
     SimTK::DecorativeSphere* clone() { 
         return new SimTK::DecorativeSphere(*self); 
     }
}

%extend SimTK::DecorativeBrick {
     SimTK::DecorativeBrick* clone() { 
         return new SimTK::DecorativeBrick(*self); 
     }
}

%extend SimTK::DecorativeLine {
     SimTK::DecorativeLine* clone() { 
         return new SimTK::DecorativeLine(*self); 
     }
}

%extend SimTK::DecorativeCylinder {
     SimTK::DecorativeCylinder* clone() { 
         return new SimTK::DecorativeCylinder(*self); 
     }
}

%extend SimTK::DecorativeEllipsoid {
     SimTK::DecorativeEllipsoid* clone() { 
         return new SimTK::DecorativeEllipsoid(*self); 
     }
}

%extend SimTK::DecorativeFrame {
     SimTK::DecorativeFrame* clone() { 
         return new SimTK::DecorativeFrame(*self); 
     }
}

%extend SimTK::DecorativeArrow {
     SimTK::DecorativeArrow* clone() { 
         return new SimTK::DecorativeArrow(*self); 
     }
}

%extend SimTK::DecorativeTorus {
     SimTK::DecorativeTorus* clone() { 
         return new SimTK::DecorativeTorus(*self); 
     }
}

%extend SimTK::DecorativeCone {
     SimTK::DecorativeCone* clone() { 
         return new SimTK::DecorativeCone(*self); 
     }
}

%include exception.i

%extend SimTK::RowVectorBase<double> {
     double get(size_t i) {
         if(i >= $self->nelt())
             throw std::out_of_range{"Index out of Range."};
         
         return $self->getElt(0, i);
     }

     double set(size_t i, double value) {
         if(i >= $self->nelt())
             throw std::out_of_range{"Index out of Range."};

         double prevValue = $self->getElt(0, i);
         $self->updElt(0, i) = value;
         return prevValue;
     }
}

%extend SimTK::VectorBase<double> {
     double get(size_t i) {
         if(i >= $self->nelt())
             throw std::out_of_range{"Index out of Range."};

         return $self->getElt(i, 0);
     }

     double set(size_t i, double value) {
         if(i >= $self->nelt())
             throw std::out_of_range{"Index out of Range."};

         double prevValue = $self->getElt(i, 0);
         $self->updElt(i, 0) = value;
         return prevValue;
     }
}

%extend SimTK::RowVectorBase<SimTK::Vec3> {
     Vec3 get(size_t i) {
         if(i >= $self->nelt())
             throw std::out_of_range{"Index out of Range."};

         return $self->getElt(0, i);
     }

     Vec3 set(size_t i, Vec3 value) {
         if(i >= $self->nelt())
             throw std::out_of_range{"Index out of Range."};

         Vec3 prevValue = $self->getElt(0, i);
         $self->updElt(0, i) = value;
         return prevValue;
     }
}

%extend SimTK::VectorBase<SimTK::Vec3> {
     Vec3 get(size_t i) {
         if(i >= $self->nelt())
             throw std::out_of_range{"Index out of Range."};

         return $self->getElt(i, 0);
     }

     Vec3 set(size_t i, Vec3 value) {
         if(i >= $self->nelt())
             throw std::out_of_range{"Index out of Range."};

         Vec3 prevValue = $self->getElt(i, 0);
         $self->updElt(i, 0) = value;
         return prevValue;
     }
}

%include <Bindings/preliminaries.i>
%include <Bindings/simbody.i>
