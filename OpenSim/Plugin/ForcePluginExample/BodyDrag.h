#ifndef __BodyDrag_h__
#define __BodyDrag_h__

// BodyDrag.h
// Author: Tim Dorn



// INCLUDE
#include <string>
#include "osimPluginDLL.h"
#include <OpenSim/Common/PropertyStr.h>
#include <OpenSim/Common/PropertyDbl.h>
#include <OpenSim/Simulation/Model/Force.h>

namespace OpenSim {


class OSIMPLUGIN_API BodyDrag : public Force  
{

//=============================================================================
// DATA
//=============================================================================
protected:
	/** Specify the body to apply the drag to. */
	PropertyStr _bodyNameProp;
	std::string& _bodyName;

	/** Specify coeficient of drag. */
	PropertyDbl _coefficientProp;
	double &_coefficient;

	/** Specify exponent of drag. */
	PropertyDbl _exponentProp;
	double &_exponent;

	

private:


//=============================================================================
// METHODS
//=============================================================================
public:
	// CONSTRUCTION
	BodyDrag();
	BodyDrag( std::string bodyName, double coefficient, double exponent); 
	BodyDrag(const BodyDrag &aForce);
	virtual ~BodyDrag();
	virtual Object* copy() const;
	BodyDrag& operator=(const BodyDrag &aForce);
	void copyData(const BodyDrag &aForce);




	//--------------------------------------------------------------------------
	// COMPUTATION
	//--------------------------------------------------------------------------
	/** Compute the bushing force contribution to the system and add in to appropriate
	  * bodyForce and/or system generalizedForce. The bushing force is [K]*dq + [D]*dqdot
	  * where, [K] is the spatial 6dof stiffness matrix between the two frames 
	           dq is the deflection in body spatial coordinates with rotations in Euler angles
	  *        [D] is the spatial 6dof damping matrix opposing the velocity between the frames
	  *        dqdot is the relative spatial velocity of the two frames
	  * BodyDrag implementation based SimTK::Force::LinearBushing
	  * developed and implemented by Michael Sherman.
	  */
	virtual void computeForce(const SimTK::State& s, 
							  SimTK::Vector_<SimTK::SpatialVec>& bodyForces, 
							  SimTK::Vector& generalizedForces) const;

    /** Potential energy is determined by the elastic energy storage of the bushing.
	    In spatial terms, U = ~dq*[K]*dq, with K and dq defined above. */
	virtual double computePotentialEnergy(const SimTK::State& s) const;

	//-----------------------------------------------------------------------------
	// Reporting
	//-----------------------------------------------------------------------------
	/** 
	 * Provide name(s) of the quantities (column labels) of the force value(s) to be reported
	 */
	virtual OpenSim::Array<std::string> getRecordLabels() const ;
	/**
	*  Provide the value(s) to be reported that correspond to the labels
	*/
	virtual OpenSim::Array<double> getRecordValues(const SimTK::State& state) const ;

protected:
	virtual void setup(Model& aModel);


private:
	void setNull();
	void setupProperties();

	
//=============================================================================
};	// END of class BodyDrag
//=============================================================================
//=============================================================================

} // end of namespace OpenSim

#endif // __BodyDrag_h__

